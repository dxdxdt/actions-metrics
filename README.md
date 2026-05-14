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
Updated: 2026-05-14T23:49:43.959767+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.886 |  |
| ap-east-1 | 0.809 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.935 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.879 |  |
| ap-southeast-7 | 0.985 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.439 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.386 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.071 | 4639 |
| us-east-2 | 0.100 | 1593 |
| us-gov-east-1 | 0.095 | 1690 |
| us-gov-west-1 | 0.309 | 195 |
| us-west-1 | 0.253 | 3562 |
| us-west-2 | 0.306 | 158 |

