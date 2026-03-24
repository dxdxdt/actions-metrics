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
Updated: 2026-03-24T22:23:33.126707+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.204 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.818 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.586 |  |
| us-east-1 | 0.146 | 4354 |
| us-east-2 | 0.159 | 1449 |
| us-gov-east-1 | 0.159 | 1601 |
| us-gov-west-1 | 0.224 | 190 |
| us-west-1 | 0.164 | 3292 |
| us-west-2 | 0.223 | 151 |

