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
Updated: 2026-03-07T12:31:03.932258+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.546 |  |
| us-east-1 | 0.096 | 4234 |
| us-east-2 | 0.082 | 1406 |
| us-gov-east-1 | 0.076 | 1538 |
| us-gov-west-1 | 0.229 | 174 |
| us-west-1 | 0.230 | 3190 |
| us-west-2 | 0.227 | 142 |

