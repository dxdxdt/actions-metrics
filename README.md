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
Updated: 2026-03-21T17:20:15.020846+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.739 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.840 |  |
| ca-central-1 | 0.246 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.580 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.514 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.875 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.205 | 4322 |
| us-east-2 | 0.198 | 1445 |
| us-gov-east-1 | 0.164 | 1593 |
| us-gov-west-1 | 0.142 | 189 |
| us-west-1 | 0.132 | 3273 |
| us-west-2 | 0.140 | 151 |

