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
Updated: 2026-09-25T12:28:30.850081+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.739 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.194 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.144 | 5121 |
| us-east-2 | 0.160 | 1686 |
| us-gov-east-1 | 0.169 | 1927 |
| us-gov-west-1 | 0.219 | 235 |
| us-west-1 | 0.158 | 4137 |
| us-west-2 | 0.216 | 192 |

