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
Updated: 2026-03-31T11:43:03.455903+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.997 |  |
| ap-east-1 | 0.707 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.712 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.896 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.470 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.873 |  |
| me-south-1 | 0.849 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.164 | 4406 |
| us-east-2 | 0.154 | 1469 |
| us-gov-east-1 | 0.162 | 1616 |
| us-gov-west-1 | 0.201 | 190 |
| us-west-1 | 0.146 | 3325 |
| us-west-2 | 0.195 | 152 |

