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
Updated: 2026-03-24T12:53:48.986163+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.561 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.684 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.755 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.861 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.155 | 4349 |
| us-east-2 | 0.189 | 1449 |
| us-gov-east-1 | 0.182 | 1600 |
| us-gov-west-1 | 0.208 | 190 |
| us-west-1 | 0.157 | 3290 |
| us-west-2 | 0.211 | 151 |

