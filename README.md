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
Updated: 2026-04-26T08:52:02.620495+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.735 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.574 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.514 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.222 | 4565 |
| us-east-2 | 0.186 | 1533 |
| us-gov-east-1 | 0.184 | 1664 |
| us-gov-west-1 | 0.151 | 194 |
| us-west-1 | 0.092 | 3483 |
| us-west-2 | 0.146 | 157 |

