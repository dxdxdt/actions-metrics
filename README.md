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
Updated: 2026-08-28T08:12:37.797515+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.213 | 18 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.509 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.434 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.143 | 5072 |
| us-east-2 | 0.167 | 1684 |
| us-gov-east-1 | 0.171 | 1887 |
| us-gov-west-1 | 0.226 | 228 |
| us-west-1 | 0.173 | 4065 |
| us-west-2 | 0.238 | 189 |

