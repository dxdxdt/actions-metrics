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
Updated: 2026-04-16T21:36:57.905586+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.935 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.102 | 4512 |
| us-east-2 | 0.098 | 1506 |
| us-gov-east-1 | 0.113 | 1652 |
| us-gov-west-1 | 0.248 | 193 |
| us-west-1 | 0.192 | 3421 |
| us-west-2 | 0.248 | 156 |

