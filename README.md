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
Updated: 2026-02-23T08:40:24.193791+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.739 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.409 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.824 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.127 | 4170 |
| us-east-2 | 0.144 | 1371 |
| us-gov-east-1 | 0.145 | 1501 |
| us-gov-west-1 | 0.269 | 160 |
| us-west-1 | 0.207 | 3101 |
| us-west-2 | 0.270 | 130 |

