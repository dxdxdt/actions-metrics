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
Updated: 2026-11-07T19:59:27.576945+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.694 |  |
| ap-east-1 | 0.570 |  |
| ap-east-2 | 0.520 |  |
| ap-northeast-1 | 0.431 |  |
| ap-northeast-2 | 0.505 |  |
| ap-northeast-3 | 0.448 |  |
| ap-south-1 | 0.635 |  |
| ap-south-2 | 0.661 |  |
| ap-southeast-1 | 0.624 |  |
| ap-southeast-2 | 0.538 |  |
| ap-southeast-3 | 0.664 |  |
| ap-southeast-4 | 0.602 |  |
| ap-southeast-5 | 0.637 |  |
| ap-southeast-6 | 0.560 |  |
| ap-southeast-7 | 0.703 |  |
| ca-central-1 | 0.120 | 18 |
| ca-west-1 | 0.171 |  |
| eu-central-1 | 0.338 |  |
| eu-central-2 | 0.350 |  |
| eu-north-1 | 0.378 |  |
| eu-south-1 | 0.353 |  |
| eu-south-2 | 0.338 |  |
| eu-west-1 | 0.274 |  |
| eu-west-2 | 0.303 |  |
| eu-west-3 | 0.318 |  |
| il-central-1 | 0.465 |  |
| me-central-1 | 0.611 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.413 |  |
| us-east-1 | 0.085 | 5177 |
| us-east-2 | 0.110 | 1721 |
| us-gov-east-1 | 0.112 | 1959 |
| us-gov-west-1 | 0.194 | 245 |
| us-west-1 | 0.144 | 4209 |
| us-west-2 | 0.192 | 196 |

