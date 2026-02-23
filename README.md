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
Updated: 2026-02-23T14:03:48.765335+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.624 |  |
| ap-east-2 | 0.564 |  |
| ap-northeast-1 | 0.447 |  |
| ap-northeast-2 | 0.555 |  |
| ap-northeast-3 | 0.473 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.699 |  |
| ap-southeast-2 | 0.580 |  |
| ap-southeast-3 | 0.754 |  |
| ap-southeast-4 | 0.621 |  |
| ap-southeast-5 | 0.718 |  |
| ap-southeast-6 | 0.623 |  |
| ap-southeast-7 | 0.805 |  |
| ca-central-1 | 0.314 | 16 |
| ca-west-1 | 0.169 |  |
| eu-central-1 | 0.595 |  |
| eu-central-2 | 0.634 |  |
| eu-north-1 | 0.629 |  |
| eu-south-1 | 0.627 |  |
| eu-south-2 | 0.627 |  |
| eu-west-1 | 0.516 |  |
| eu-west-2 | 0.554 |  |
| eu-west-3 | 0.569 |  |
| il-central-1 | 0.787 |  |
| me-central-1 | 0.982 |  |
| me-south-1 | 0.927 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.716 |  |
| us-east-1 | 0.256 | 4170 |
| us-east-2 | 0.229 | 1371 |
| us-gov-east-1 | 0.234 | 1502 |
| us-gov-west-1 | 0.110 | 160 |
| us-west-1 | 0.056 | 3105 |
| us-west-2 | 0.111 | 130 |

