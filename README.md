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
Updated: 2026-02-17T23:22:20.841417+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.235 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.511 |  |
| eu-central-2 | 0.525 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.491 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.853 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.166 | 4137 |
| us-east-2 | 0.172 | 1353 |
| us-gov-east-1 | 0.172 | 1486 |
| us-gov-west-1 | 0.195 | 153 |
| us-west-1 | 0.146 | 3070 |
| us-west-2 | 0.198 | 126 |

