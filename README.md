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
Updated: 2026-05-06T19:26:03.812413+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.624 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.807 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.845 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.450 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.453 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.406 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.088 | 4604 |
| us-east-2 | 0.083 | 1569 |
| us-gov-east-1 | 0.081 | 1677 |
| us-gov-west-1 | 0.268 | 194 |
| us-west-1 | 0.215 | 3536 |
| us-west-2 | 0.265 | 157 |

