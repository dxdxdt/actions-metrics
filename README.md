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
Updated: 2026-05-09T05:41:44.123827+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.587 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.848 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.820 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.088 | 4613 |
| us-east-2 | 0.101 | 1577 |
| us-gov-east-1 | 0.098 | 1682 |
| us-gov-west-1 | 0.282 | 195 |
| us-west-1 | 0.227 | 3542 |
| us-west-2 | 0.259 | 157 |

