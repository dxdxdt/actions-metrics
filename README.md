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
Updated: 2026-05-09T09:10:58.535022+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.805 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.852 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.103 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.396 |  |
| eu-north-1 | 0.419 |  |
| eu-south-1 | 0.399 |  |
| eu-south-2 | 0.414 |  |
| eu-west-1 | 0.296 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.535 |  |
| me-central-1 | 0.760 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.053 | 4615 |
| us-east-2 | 0.090 | 1577 |
| us-gov-east-1 | 0.091 | 1682 |
| us-gov-west-1 | 0.308 | 195 |
| us-west-1 | 0.259 | 3542 |
| us-west-2 | 0.319 | 157 |

