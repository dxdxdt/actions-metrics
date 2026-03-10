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
Updated: 2026-03-10T04:02:46.321511+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.790 |  |
| mx-central-1 | 0.258 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.100 | 4251 |
| us-east-2 | 0.087 | 1413 |
| us-gov-east-1 | 0.086 | 1550 |
| us-gov-west-1 | 0.227 | 176 |
| us-west-1 | 0.230 | 3205 |
| us-west-2 | 0.220 | 144 |

