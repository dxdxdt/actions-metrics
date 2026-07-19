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
Updated: 2026-07-19T16:48:34.869227+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.943 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.546 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.185 | 4885 |
| us-east-2 | 0.189 | 1657 |
| us-gov-east-1 | 0.171 | 1770 |
| us-gov-west-1 | 0.181 | 204 |
| us-west-1 | 0.126 | 3805 |
| us-west-2 | 0.181 | 167 |

