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
Updated: 2026-11-12T01:12:19.872244+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.689 |  |
| ap-east-1 | 0.582 |  |
| ap-east-2 | 0.533 |  |
| ap-northeast-1 | 0.446 |  |
| ap-northeast-2 | 0.524 |  |
| ap-northeast-3 | 0.467 |  |
| ap-south-1 | 0.637 |  |
| ap-south-2 | 0.752 |  |
| ap-southeast-1 | 0.641 |  |
| ap-southeast-2 | 0.562 |  |
| ap-southeast-3 | 0.680 |  |
| ap-southeast-4 | 0.625 |  |
| ap-southeast-5 | 0.651 |  |
| ap-southeast-6 | 0.585 |  |
| ap-southeast-7 | 0.712 |  |
| ca-central-1 | 0.092 | 18 |
| ca-west-1 | 0.150 |  |
| eu-central-1 | 0.323 |  |
| eu-central-2 | 0.335 |  |
| eu-north-1 | 0.369 |  |
| eu-south-1 | 0.343 |  |
| eu-south-2 | 0.332 |  |
| eu-west-1 | 0.267 |  |
| eu-west-2 | 0.292 |  |
| eu-west-3 | 0.310 |  |
| il-central-1 | 0.442 |  |
| me-central-1 | 0.584 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.529 |  |
| mx-central-1 | 0.176 |  |
| sa-east-1 | 0.397 |  |
| us-east-1 | 0.062 | 5179 |
| us-east-2 | 0.066 | 1727 |
| us-gov-east-1 | 0.082 | 1959 |
| us-gov-west-1 | 0.204 | 245 |
| us-west-1 | 0.163 | 4216 |
| us-west-2 | 0.207 | 197 |

