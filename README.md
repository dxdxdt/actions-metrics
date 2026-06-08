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
Updated: 2026-06-08T23:59:19.807067+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.721 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.520 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.140 | 4735 |
| us-east-2 | 0.115 | 1629 |
| us-gov-east-1 | 0.115 | 1709 |
| us-gov-west-1 | 0.218 | 198 |
| us-west-1 | 0.165 | 3649 |
| us-west-2 | 0.210 | 162 |

