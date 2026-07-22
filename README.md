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
Updated: 2026-07-22T12:27:13.645933+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.999 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.966 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.688 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.254 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.521 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.682 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.634 |  |
| us-east-1 | 0.183 | 4897 |
| us-east-2 | 0.201 | 1659 |
| us-gov-east-1 | 0.173 | 1774 |
| us-gov-west-1 | 0.188 | 206 |
| us-west-1 | 0.125 | 3818 |
| us-west-2 | 0.189 | 167 |

