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
Updated: 2026-11-06T03:00:01.861657+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.761 |  |
| ap-east-1 | 0.496 |  |
| ap-east-2 | 0.454 |  |
| ap-northeast-1 | 0.360 |  |
| ap-northeast-2 | 0.440 |  |
| ap-northeast-3 | 0.381 |  |
| ap-south-1 | 0.649 |  |
| ap-south-2 | 0.653 |  |
| ap-southeast-1 | 0.558 |  |
| ap-southeast-2 | 0.498 |  |
| ap-southeast-3 | 0.596 |  |
| ap-southeast-4 | 0.549 |  |
| ap-southeast-5 | 0.569 |  |
| ap-southeast-6 | 0.524 |  |
| ap-southeast-7 | 0.631 |  |
| ca-central-1 | 0.177 | 18 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.430 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.413 |  |
| eu-west-1 | 0.333 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.519 |  |
| me-central-1 | 0.665 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.185 |  |
| sa-east-1 | 0.484 |  |
| us-east-1 | 0.161 | 5173 |
| us-east-2 | 0.144 | 1721 |
| us-gov-east-1 | 0.160 | 1959 |
| us-gov-west-1 | 0.118 | 244 |
| us-west-1 | 0.114 | 4207 |
| us-west-2 | 0.117 | 196 |

