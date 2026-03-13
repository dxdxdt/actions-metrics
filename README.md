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
Updated: 2026-03-13T19:26:48.491334+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.622 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.228 | 16 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.559 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.466 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.195 | 4277 |
| us-east-2 | 0.173 | 1422 |
| us-gov-east-1 | 0.167 | 1570 |
| us-gov-west-1 | 0.153 | 182 |
| us-west-1 | 0.138 | 3220 |
| us-west-2 | 0.163 | 146 |

