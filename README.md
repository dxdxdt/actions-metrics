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
Updated: 2026-03-14T07:31:44.332315+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.064 |  |
| ap-east-1 | 0.637 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.456 |  |
| ap-northeast-2 | 0.566 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.719 |  |
| ap-southeast-2 | 0.596 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.635 |  |
| ap-southeast-5 | 0.733 |  |
| ap-southeast-6 | 0.632 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.292 | 16 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.584 |  |
| eu-central-2 | 0.594 |  |
| eu-north-1 | 0.634 |  |
| eu-south-1 | 0.610 |  |
| eu-south-2 | 0.617 |  |
| eu-west-1 | 0.517 |  |
| eu-west-2 | 0.539 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.758 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.912 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.241 | 4278 |
| us-east-2 | 0.228 | 1422 |
| us-gov-east-1 | 0.228 | 1573 |
| us-gov-west-1 | 0.125 | 183 |
| us-west-1 | 0.074 | 3224 |
| us-west-2 | 0.127 | 146 |

