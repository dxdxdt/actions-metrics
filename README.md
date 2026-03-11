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
Updated: 2026-03-11T11:27:52.933522+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.949 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.684 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.840 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.596 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.720 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.873 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.207 | 4258 |
| us-east-2 | 0.168 | 1418 |
| us-gov-east-1 | 0.165 | 1560 |
| us-gov-west-1 | 0.151 | 178 |
| us-west-1 | 0.135 | 3209 |
| us-west-2 | 0.153 | 144 |

