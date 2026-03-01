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
Updated: 2026-03-01T11:14:45.856632+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.951 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.819 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.417 |  |
| eu-south-2 | 0.412 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.562 |  |
| me-central-1 | 0.764 |  |
| me-south-1 | 0.724 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.490 |  |
| us-east-1 | 0.058 | 4205 |
| us-east-2 | 0.085 | 1387 |
| us-gov-east-1 | 0.101 | 1519 |
| us-gov-west-1 | 0.315 | 166 |
| us-west-1 | 0.256 | 3146 |
| us-west-2 | 0.304 | 135 |

