# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-02T23:52:39.774754+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.892 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.906 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.142 | 17 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.441 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.569 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.083 | 4935 |
| us-east-2 | 0.105 | 1673 |
| us-gov-east-1 | 0.119 | 1798 |
| us-gov-west-1 | 0.282 | 209 |
| us-west-1 | 0.219 | 3875 |
| us-west-2 | 0.283 | 172 |

