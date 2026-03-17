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
Updated: 2026-03-17T22:25:52.929728+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.948 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.541 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.149 | 4298 |
| us-east-2 | 0.129 | 1431 |
| us-gov-east-1 | 0.152 | 1584 |
| us-gov-west-1 | 0.181 | 188 |
| us-west-1 | 0.182 | 3248 |
| us-west-2 | 0.182 | 148 |

