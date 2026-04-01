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
Updated: 2026-04-01T18:51:13.387669+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.386 |  |
| eu-west-2 | 0.429 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.121 | 4415 |
| us-east-2 | 0.109 | 1471 |
| us-gov-east-1 | 0.113 | 1618 |
| us-gov-west-1 | 0.238 | 190 |
| us-west-1 | 0.189 | 3332 |
| us-west-2 | 0.245 | 153 |

