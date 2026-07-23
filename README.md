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
Updated: 2026-07-23T17:12:08.677316+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.697 |  |
| ap-east-2 | 0.641 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.517 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.174 | 4901 |
| us-east-2 | 0.141 | 1660 |
| us-gov-east-1 | 0.144 | 1776 |
| us-gov-west-1 | 0.188 | 206 |
| us-west-1 | 0.075 | 3823 |
| us-west-2 | 0.187 | 168 |

