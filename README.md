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
Updated: 2026-08-14T16:42:32.895682+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.874 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.127 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.388 |  |
| il-central-1 | 0.571 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.072 | 4994 |
| us-east-2 | 0.096 | 1679 |
| us-gov-east-1 | 0.100 | 1827 |
| us-gov-west-1 | 0.298 | 222 |
| us-west-1 | 0.231 | 3946 |
| us-west-2 | 0.297 | 177 |

