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
Updated: 2026-09-01T15:21:16.018719+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.852 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.218 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.563 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.463 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.881 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.154 | 5077 |
| us-east-2 | 0.171 | 1685 |
| us-gov-east-1 | 0.188 | 1891 |
| us-gov-west-1 | 0.205 | 228 |
| us-west-1 | 0.168 | 4074 |
| us-west-2 | 0.204 | 190 |

