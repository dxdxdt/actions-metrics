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
Updated: 2026-04-09T19:08:51.368038+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.749 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.423 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.135 | 4467 |
| us-east-2 | 0.144 | 1489 |
| us-gov-east-1 | 0.129 | 1637 |
| us-gov-west-1 | 0.215 | 192 |
| us-west-1 | 0.164 | 3383 |
| us-west-2 | 0.214 | 154 |

