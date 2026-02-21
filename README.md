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
Updated: 2026-02-21T05:07:28.588700+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.505 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.128 | 4156 |
| us-east-2 | 0.112 | 1359 |
| us-gov-east-1 | 0.114 | 1496 |
| us-gov-west-1 | 0.202 | 160 |
| us-west-1 | 0.185 | 3089 |
| us-west-2 | 0.205 | 129 |

