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
Updated: 2026-03-12T14:46:14.707284+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.820 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.752 |  |
| ap-northeast-3 | 0.661 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.902 |  |
| ap-southeast-2 | 0.825 |  |
| ap-southeast-3 | 0.956 |  |
| ap-southeast-4 | 0.853 |  |
| ap-southeast-5 | 0.913 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 1.006 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.367 |  |
| eu-central-2 | 0.389 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.402 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.300 |  |
| eu-west-2 | 0.337 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.740 |  |
| me-south-1 | 0.701 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.479 |  |
| us-east-1 | 0.049 | 4269 |
| us-east-2 | 0.089 | 1419 |
| us-gov-east-1 | 0.105 | 1565 |
| us-gov-west-1 | 0.321 | 180 |
| us-west-1 | 0.258 | 3214 |
| us-west-2 | 0.325 | 144 |

