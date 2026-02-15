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
Updated: 2026-02-15T06:41:45.928380+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.050 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.583 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.569 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.620 |  |
| ap-southeast-3 | 0.782 |  |
| ap-southeast-4 | 0.661 |  |
| ap-southeast-5 | 0.749 |  |
| ap-southeast-6 | 0.673 |  |
| ap-southeast-7 | 0.833 |  |
| ca-central-1 | 0.276 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.585 |  |
| eu-north-1 | 0.598 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.597 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.520 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.736 |  |
| me-central-1 | 0.936 |  |
| me-south-1 | 0.899 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.214 | 4122 |
| us-east-2 | 0.200 | 1341 |
| us-gov-east-1 | 0.196 | 1470 |
| us-gov-west-1 | 0.141 | 148 |
| us-west-1 | 0.102 | 3062 |
| us-west-2 | 0.143 | 125 |

