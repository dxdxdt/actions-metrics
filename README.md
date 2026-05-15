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
Updated: 2026-05-15T02:28:54.367000+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.902 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.530 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.146 | 4639 |
| us-east-2 | 0.170 | 1593 |
| us-gov-east-1 | 0.153 | 1690 |
| us-gov-west-1 | 0.229 | 195 |
| us-west-1 | 0.168 | 3563 |
| us-west-2 | 0.225 | 158 |

